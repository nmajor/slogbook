CKEDITOR.on('dialogDefinition', function( ev )
{
   var dialogName = ev.data.name;  
   var dialogDefinition = ev.data.definition;
         
   switch (dialogName) {  
   case 'image': //Image Properties dialog      
   dialogDefinition.removeContents('Link');
   dialogDefinition.removeContents('advanced');
   break;      
   case 'link': //image Properties dialog          
   dialogDefinition.removeContents('advanced');   
   break;
   }
});
