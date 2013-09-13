# http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = '860'
  config.height = '400'
  config.toolbar_Slog = [
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','-','RemoveFormat' ] },
    { name: 'insert',      items: [ 'Image','HorizontalRule','SpecialChar' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
    { name: 'editing',     items: [ 'Find','Replace','-','SpellChecker', 'Scayt' ] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks' ] }
    { name: 'links',       items: [ 'Link','Unlink' ] },
    { name: 'document',    items: [ 'Source' ] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor' ] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
  ]
  config.toolbar = 'Slog'
  true
