// http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = function( config ){
  config.toolbar = 'Slog';
  config.language = 'en';
  config.height = '400';

  // The location of a script that handles file uploads in the Image dialog.
  config.ImageBrowser = false;
  config.ImageLink = false;
  config.scayt_autoStartup = true;
  
  config.toolbar_Slog = 
  [
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline'] },
    { name: 'insert',      items: [ 'Image','HorizontalRule'] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyBlock' ] },
    { name: 'links',       items: [ 'Link', 'Unlink' ] },
    { name: 'styles',      items: [ 'Format'] },
    { name: 'clipboard',   items: [ 'PasteText','PasteFromWord','-','Undo','Redo' ] },
  ];
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
 // Rails CSRF token
    config.filebrowserParams = function(){
        var csrf_token, csrf_param, meta,
            metas = document.getElementsByTagName('meta'),
            params = new Object();

        for ( var i = 0 ; i < metas.length ; i++ ){
            meta = metas[i];

            switch(meta.name) {
                case "csrf-token":
                    csrf_token = meta.content;
                    break;
                case "csrf-param":
                    csrf_param = meta.content;
                    break;
                default:
                    continue;
            }
        }

        if (csrf_param !== undefined && csrf_token !== undefined) {
            params[csrf_param] = csrf_token;
        }

        return params;
    };

    config.addQueryString = function( url, params ){
        var queryString = [];

        if ( !params ) {
            return url;
        } else {
            for ( var i in params )
                queryString.push( i + "=" + encodeURIComponent( params[ i ] ) );
        }

        return url + ( ( url.indexOf( "?" ) != -1 ) ? "&" : "?" ) + queryString.join( "&" );
    };

    // Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
    CKEDITOR.on( 'dialogDefinition', function( ev ){
        // Take the dialog name and its definition from the event data.
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
        var content, upload;

        if (CKEDITOR.tools.indexOf(['link', 'image', 'attachment', 'flash'], dialogName) > -1) {
            content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'));
            upload = (content == null ? null : content.get('upload'));

            if (upload && upload.filebrowser && upload.filebrowser['params'] === undefined) {
                upload.filebrowser['params'] = config.filebrowserParams();
                upload.action = config.addQueryString(upload.action, upload.filebrowser['params']);
            }
        }
    });
};
