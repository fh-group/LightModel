// More a messages / alerts / errors component, but errors is where is all started.
// TODO: Incorporate error object and append those to error array instead which would allow
// more possible expantion of information for errors themselves versus just a message.
component name="Errors" output="false" accessors="true" hint="I contain all of a model's errors"
{
  // icanhas new errors?
  public any function init()
  {
    variables.error_struct = StructNew();
    variables._ = new Underscore();
  }

  // Retrieve a struct (easily serializable) of all
  // errors across all properties.
  public struct function getErrors(){
    return variables.error_struct;
  }

  // Retrieve errors relating to a certain property.
  public array function getErrorsByProperty(required string property){
    if(structKeyExists(variables.error_struct,property))
      return variables.error_struct[property];
    else
      return [];
  }


  // Generate HTML of all errors which prints to an errors_messages div.
  // Could easily be styled with Bootstrap.
  public string function printErrors(){
    var errorsHTML = '';
    var errorsArray = '';

    if(!structIsEmpty(variables.error_struct)){
      errorsHTML &= '<div class="error_messages">';

      errorsHTML &= _.reduce(
        _.map(variables.error_struct, function(messages, property){ return '<div class="errors-property" data-property="#arguments.property#">#reduceMessages(arguments.messages)#</div>';
        }),
        function(memo, errors){ return memo &= errors; }
      );

      errorsHTML &= '</div>';
    }

    return errorsHTML;
  }

  // Take all errors messages and turn them into a single dimension array of HTML strings.
  // Can be used to easily output messages to browser screens.
  private string function reduceMessages(messages){
    return _.reduce(
                    _.map(arguments.messages,
                          function(message){
                            return '<div class="error-message">#arguments.message#</div>';
                          }
                    ),
                    function(memo, message){
                      return memo &= message;
                    }
          );
  }

  // Add an error message to a specific property.
  // TODO: Is it worth it to allow adding messages to a 'this' for entire object errors?
  public void function add(string property, string message){
    if(!isSimpleValue(arguments.message))
      throw (type="ArgumentError", message="Message must be a simple value.");

    if(structKeyExists(variables.error_struct, property)){
      ArrayAppend(variables.error_struct[property], message);
    }else{
      variables.error_struct[property] = [message];
    }
  }

  // Remove all messages that have been built up.
  // >> /dev/null amirite?
  public void function clearMessages(){
    variables.errorStruct = {};
  }
}
