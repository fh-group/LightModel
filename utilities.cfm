<cfscript>
  private array function _getProperties(){
    var loc = {};
    loc.metadata = getMetadata(this);
    loc.properties = Duplicate(loc.metadata.extends.properties);
    arrayEach(loc.metadata.properties, function(property){
      ArrayAppend(loc.properties, property);
    });

    return loc.properties;
  }

  private array function _getPropertyNames(){
    var loc = {};
    loc.metadata = getMetadata(this);
    loc.properties = Duplicate(loc.metadata.extends.properties);
    arrayEach(loc.metadata.properties, function(property){
      ArrayAppend(loc.properties, property);
    });

    loc.propertyNames = this._.map(loc.properties, function(property){ return property.name; });

    return loc.propertyNames;
  }

  private boolean function _hasProperty(required string property){
    var loc = {};
    loc.property = arguments.property;
    loc.propertyNames = _getPropertyNames();
    return this._.any(loc.propertyNames, function(name){ return name == loc.property });
  }
</cfscript>
