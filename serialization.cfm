<cfscript>
  // Serialization
  // Allows model properties to be serialized to JSON, XML, and Struct.

  public any function to_struct(){
    var properties = _getProperties();
    var jsonStruct = StructNew();
    arrayEach(properties, function(obj){
      var value = '';
      if(!StructKeyExists(obj, 'getter') || (StructKeyExists(obj, 'getter') && obj.getter == true)){
        jsonStruct[obj.name] = invoke(this, "get#obj.name#");
      }
    });

    return jsonStruct;
  }

  public any function to_json(){
    var properties = _getProperties();
    var jsonStruct = StructNew();
    arrayEach(properties, function(obj){
      var value = '';
      if(!StructKeyExists(obj, 'getter') || (StructKeyExists(obj, 'getter') && obj.getter == true)){
        jsonStruct[obj.name] = invoke(this, "get#obj.name#");
      }
    });

    return serializeJSON(jsonStruct);
  }

  public any function to_xml(){
    Throw(type="NotImplemented", message="Method Not Yet Implemented.");
  }
</cfscript>
