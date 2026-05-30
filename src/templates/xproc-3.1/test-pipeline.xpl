<p:declare-step 
	xmlns:p="http://www.w3.org/ns/xproc" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:err="http://www.w3.org/ns/xproc-error"
	xmlns:c="http://www.w3.org/ns/xproc-step"
	xmlns:xt="http://www.w3.org/ns/xproc/test"
	version="3.1" name="test">
	
	
	<p:documentation>
	${caret}
	</p:documentation>
   
	<!-- INPUT PORTS -->
	<p:input port="source" primary="true" />
  
   
	<!-- OUTPUT PORTS -->
	<p:output port="result" primary="true" />
	
	
	<!-- PIPELINE BODY -->
	
	<p:identity />

</p:declare-step>
