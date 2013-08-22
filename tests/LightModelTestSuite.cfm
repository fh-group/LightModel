<cfinvoke component="mxunit.runner.DirectoryTestSuite"
          method="run"
          directory="#expandPath('.')#"
          componentPath="includes.cf.models.LightModel.tests"
          recurse="true"
          returnvariable="results" />
 
<cfoutput> #results.getResultsOutput('extjs')# </cfoutput>
