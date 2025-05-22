<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:c="http://www.w3.org/ns/xproc-step"
	xmlns:xpan="https://www.daliboris.cz/ns/xproc/analysis"
	version="3.0">
	
	<p:documentation></p:documentation>
   
	<p:option name="input-directory" select="'.'" />
  <p:input port="source" primary="true" sequence="true">
  	<p:empty />
  </p:input>
   
	<p:output port="result" serialization="map{'indent' : true()}" />
	
	<p:directory-list path="{$input-directory}" include-filter="^.*\.xpl" />
	
	<p:for-each>
		<p:with-input select="//c:file"/>
		<p:variable name="source" select="resolve-uri(/c:file/@name, base-uri(/))" />
		<p:load href="{$source}" />
		<p:xslt>
			<p:with-input port="stylesheet" href="../Xslt/xproc-analyzer.xsl" />
		</p:xslt>
	</p:for-each>
	
	<p:wrap-sequence wrapper="xpan:report" />
	<p:store href="../Result/analysis-report.xml" serialization="map{'indent' : true()}" message="Storing text to ../Result/analysis-report.xml" />
	
	<p:xslt>
		<p:with-input port="stylesheet" href="../Xslt/analysis-report-to-html.xsl" />
	</p:xslt>
	<p:store href="../Result/analysis-report.html" serialization="map{'indent' : true()}" message="Storing text to ../Result/analysis-report.html" />
	
</p:declare-step>
