import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  script: DS.attr('string'),
  tagList: DS.attr()
});
