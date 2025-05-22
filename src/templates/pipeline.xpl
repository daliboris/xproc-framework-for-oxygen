<p:declare-step 
	xmlns:p="http://www.w3.org/ns/xproc" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xf="https://www.example.com/ns/xproc/function"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	version="3.0">
	
	<p:import href="library.xpl" />
	
	<p:documentation>
		<xhtml:section>
			<xhtml:h2></xhtml:h2>
			<xhtml:p></xhtml:p>
		</xhtml:section>
	</p:documentation>
   
	<!-- INPUT PORTS -->
  <p:input port="source" primary="true">
  	<p:document href="" />
  </p:input>
   
	<!-- OUTPUT PORTS -->
	<p:output port="result" primary="true" />
	
	<!-- OPTIONS -->
	<p:option name="debug-path" select="()" as="xs:string?" />
	<p:option name="base-uri" as="xs:anyURI" select="static-base-uri()"/>
	
	<!-- VARIABLES -->
	<p:variable name="debug" select="$debug-path || '' ne ''" />
	<p:variable name="debug-path-uri" select="resolve-uri($debug-path, $base-uri)" />
	
	<!-- PIPELINE BODY -->
	<p:xslt>
		<p:with-input port="stylesheet" href="../Xslt/?.xsl" />
		<p:with-option name="parameters" select="map {'parameter' : 'value' }" />
	</p:xslt>
	
	<p:if test="$debug">
		<p:store href="{$debug-path-uri}/?.?" />
	</p:if>
	
	<xf:first-function debug-path="{$debug-path}" base-uri="{$base-uri}"/>
		
	<p:store href="../result/?.xml" serialization="map{'indent' : true()}" message="Storing result to ../result/?.xml" />
	

</p:declare-step>
