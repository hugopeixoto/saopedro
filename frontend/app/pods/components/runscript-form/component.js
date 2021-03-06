import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    var that = this;

    Ember.$('input[name=tags]').tagsinput();

    Ember.$('input[name=upload]').fileinput({
        showPreview: false,
        showRemove: false,
        showUpload: false
    }).on('fileloaded', function(event, file, previewId, index, reader) {
      reader.onload = function(f) {
        that.set('model.script', f.target.result);
      };

      reader.readAsText(file);
    });
  }
});
