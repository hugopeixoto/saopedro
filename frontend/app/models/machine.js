import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  status: DS.attr('string'),
  diskUsage: DS.attr(),
  tagList: DS.attr(),
  machineTemplate: DS.belongsTo('machineTemplate')
});
