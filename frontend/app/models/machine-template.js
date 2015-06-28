import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  disk: DS.attr(),
  cores: DS.attr(),
  ram: DS.attr(),
  price: DS.attr(),
  location: DS.attr(),
  transfer: DS.attr(),
  provider: DS.belongsTo('provider')
});
