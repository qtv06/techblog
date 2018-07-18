$(document).on("turbolinks:load",function(){
  if ($('textarea').length > 0) {
    var data = $('.ckeditor');
    $.each(data, function(i) {
      CKEDITOR.replace(data[i].id)
    });
  }
  CKEDITOR.editorConfig = function(config){
   config.toolbar = [
      {name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFormWord', '-', 'Undo', 'Redo']},
      {name: 'editing', items: ['Scayt']},
      {name: 'links', items: ['Link', 'Unlink', 'Anchor']},
      {name: 'insert', items: ['Image', 'Table', 'HorizontaRule', 'SpecialChar']},
      {name: 'tool', items: ['Maximize']},
      {name: 'document', items: ['Source']}
   ];
  };
  CKEDITOR.config.image_previewText = "Image Preview";
  CKEDITOR.on( 'dialogDefinition', function(ev){
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;

    if (dialogName == 'link')
    {
      dialogDefinition.removeContents('advanced');
      dialogDefinition.removeContents('target');
    }

    if (dialogName == 'image')
    {
      dialogDefinition.removeContents('advanced');
      dialogDefinition.removeContents('Link');
      dialogDefinition.removeContents('Upload');
      // dialogDefinition.height = 800;
      // dialogDefinition.width = 1700;
    }
    if (dialogName == 'flash')
    {
      dialogDefinition.removeContents('advanced');
    }
  });
});
