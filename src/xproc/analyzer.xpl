<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:xpan="https://www.daliboris.cz/ns/xproc/analysis"
  xmlns:c="http://www.w3.org/ns/xproc-step" 
  version="1.0" name="xproc-analyzer">
  
  
  <p:option name="input-directory" />
  
  <p:input port="source" primary="true" sequence="true">
    <p:empty />
  </p:input>
  
  <p:output port="result" />
    
  
  
  <p:directory-list include-filter="^.*\.xpl">
    <p:with-option name="path" select="$input-directory" />
  </p:directory-list>
  
  <p:filter select="//c:file"/>
  
  <p:for-each>
    <!--<p:iteration-source select="//c:file"/>-->
    <p:variable name="filename" select="c:file/@name"/>
    
    <p:make-absolute-uris match="c:file/@name">
      <p:with-option name="base-uri" select="$input-directory"/>
    </p:make-absolute-uris>
    
    <p:load dtd-validate="false">
      <p:with-option name="href" select="c:file/@name"/>
    </p:load>
    
    
    
    <p:xslt>
      <p:input port="stylesheet">
        <p:document href="../xslt/xproc-analyzer.xsl" />
      </p:input>
      <p:input port="parameters">
        <p:empty/>
      </p:input>
    </p:xslt>
  </p:for-each>
  
  <p:wrap-sequence wrapper="xpan:report" name="report" />
  
  <!--<p:store href="../Result/analysis-report.xml"  />-->
  
  <p:xslt name="html-report">
    <p:input port="source">
      <p:pipe port="result" step="report"/>        
    </p:input>
    <p:input port="stylesheet">
      <p:document href="../xslt/analysis-report-to-html.xsl" />
    </p:input>
    <p:input port="parameters">
      <p:empty/>
    </p:input>
  </p:xslt>
  <!--<p:store href="../Result/analysis-report.html"  />-->

  

</p:declare-step>