<cfscript>
  variables._ = new Underscore();
  variables.validators = [];

  // Runs validation on model.
  public boolean function validate(){
    runValidators();

    return variables.valid;
  }

  // Lists current validators on model.
  public Array function validators() {
    return variables.validators;
  }

  // Removes all validations from model
  public void function removeValidators() {
    variables.validators = [];
  }

  private void function addValidator(any validator){
    arrayAppend(variables.validators, arguments.validator);
  }

  <!---
  //
  // Validation Methods
  //
  --->
  private void function validatesLength(string property, string comparison, struct options={}){
    var validator = '';
    var argsColl = StructNew();

    if((!IsDefined('arguments.property') && arguments.property == "")){ throw(type="ArgumentError", message="Property can not be null."); }
    if(!IsDefined('arguments.comparison') || arguments.comparison == ""){ throw(type="ArgumentError", message="Comparison can not be null."); }

    if(arguments.comparison == "within" &&
      (
        (StructKeyExists(arguments.options, 'minimum') && !StructKeyExists(arguments.options, 'maximum'))
        || (StructKeyExists(arguments.options, 'maximum') && !StructKeyExists(arguments.options, 'minimum'))
      )
    )
    {
      throw(type="ArgumentError", message="Minimum has been set without a maximum. Please set maximum to a number.");
    }

    if(!StructKeyExists(arguments.options, 'length') && (arguments.comparison == 'max' || arguments.comparison == 'min' || arguments.comparison == 'equals' || arguments.comparison == ''))
    {
      throw(type="ArgumentError", message="Length must be set. Please set it to a number.");
    }

    argsColl.comparison = arguments.comparison;
    structAppend(arguments.options, argsColl);

    validator = new LightModel.validators.LengthValidator(options=arguments.options);
    validator.setTarget(this).setProperty(arguments.property);
    this.addValidator(validator);
  }

  private void function validatesPresence(string property, struct options={}){
    var validator = '';

    if((!IsDefined('arguments.property') && arguments.property == "")){ throw(type="ArgumentError", message="Property can not be blank."); }

    validator = new LightModel.validators.PresenceValidator(options=arguments.options);
    validator.setTarget(this).setProperty(arguments.property);
    this.addValidator(validator);
  }

  private void function validatesConfirmation(string property, struct options={}){
    var validator = '';

    if((!IsDefined('arguments.property') && arguments.property == "")){ throw(type="ArgumentError", message="Property can not be blank."); }

    validator = new LightModel.validators.PresenceValidator(options=arguments.options);
    validator.setTarget(this).setProperty(arguments.property);
    this.addValidator(validator);
  }

  private void function validatesNumericality(string property, struct options = {}){
    var validator = '';

    if((!IsDefined('arguments.property'))){ throw(type="ArgumentError", message="Property must be defined."); }

    validator = new LightModel.validators.NumericalityValidator(options=arguments.options);
    validator.setTarget(this).setProperty(arguments.property);
    this.addValidator(validator);
  }

  private void function validatesFormat(string property, struct options = {}){
    var validator = '';

    if((!IsDefined('arguments.property'))){ throw(type="ArgumentError", message="Property must be defined."); }
    
    validator = new LightModel.validators.FormatValidator(options=arguments.options);
    validator.setTarget(this).setProperty(arguments.property);
    this.addValidator(validator);
  }

  private void function validatesCustom(string property, component validator, struct options = {}){
    if(!IsDefined('arguments.property')){ throw(type="ArgumentError", message="Property must be defined."); }
    if(!IsDefined('arguments.validator')){ throw(type="ArgumentError", message="Validator must be defined."); }

    arguments.validator.setTarget(this).setProperty(arguments.property);
    this.addValidator(arguments.validator)
  }

  private void function runValidators(){
    variables.valid = (!arrayIsEmpty(variables.validators)) ? _.all(_.map(variables.validators, function(v){ return v.run(); })) : true;
  }
</cfscript>
