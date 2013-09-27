<cfscript>
  // Initialization
  // Handles logic around creating new objects

  // Will set all available properties on object to the available
  // matching columns in the query or struct. Will only use the
  // first row if it is a query.
  private void function setProperties(required any obj, string namespace, array propertyWhitelist = []){
    var metadata = getMetadata(this);
    var properties = Duplicate(metadata.extends.properties);
    arrayEach(metadata.properties, function(property){
      ArrayAppend(properties, property);
    });

    if (IsQuery(arguments.obj) && arguments.obj.recordCount != 0)
          arguments.obj = queryRowToStruct(obj);

    if (IsStruct(arguments.obj) && !StructIsEmpty(arguments.obj)){
      for (key in arguments.obj)
      {
        if(structKeyExists(arguments, 'namespace') && arguments.namespace != '' && !arrayFindNoCase(arguments.propertyWhitelist, key)){
          new_key = ReplaceNoCase(key, arguments.namespace&'_', '');
          setProperty(new_key, arguments.obj[key]);
        }else{
          setProperty(key, arguments.obj[key]);
        }
      }
    }
  }

  // Naively sets properties by using a given property name and a value. The method
  // will append `set` to the front of the property and hand the value as the arguement.
  // If the setter does not exist, it will not set the property. Really wish ColdFusion
  // would make accessors (setters / getters) first class citizens.
  private void function setProperty(required string property, required any value){
    var loc = {};

    loc.propertiesList = _getPropertyNames();

    if(_hasProperty(arguments.property)){
      loc.receiverType = getMetaData(this["set#arguments.property#"]).parameters[1].type;
      loc.senderType = getMetaData(arguments.value).getName();

      if(!(loc.senderType == 'java.lang.String' && arguments.value == '')){
        this["set#arguments.property#"](arguments.value);
      }
    }
  }

  // Takes the first row in a query and turns it into a structure of
  // properties and values. Used settings properties on objects.
  // Returns struct of properties / values of first row of query.
  // Columns are properties and the first row's value is the value.
  private struct function queryRowToStruct(required query q, numeric row = 1){
    var loc = {};
    loc.returnValue = {};

    loc.properties = arguments.q.columnList;
    loc.amtOfProperties = ListLen(loc.properties);

    for(loc.i=1; loc.i <= loc.amtOfProperties; loc.i++){
      loc.col = ListGetAt(loc.properties, loc.i);
      if (ListFindNoCase(arguments.q.columnList, loc.col))
        loc.returnValue[loc.col] = arguments.q[loc.col][arguments.row];
    }

    return loc.returnValue;
  }
</cfscript>
