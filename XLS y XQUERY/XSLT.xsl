<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--DOCUMENTO ENTERO-->
<xsl:template match="/">
<html>
<head>
<style>

table{border: 1px solid black;}
th{border: 1px solid black;}
td{border: 1px solid black;padding: 1px;}
.individual{background-color:D7DDE4;}
.tagteam{background-color:ACADAF;}

</style>
</head>
<body>
<xsl:apply-templates />
</body>
</html>
</xsl:template>


<!--DOCUMENTO-->
<xsl:template match="rosterwwe">
<h1>Rosterwwe</h1>
<table>
  <tr>
    <th>Categoria</th>
    <th>Gimnick</th>
    <th>Titulos</th>
  </tr>
<xsl:apply-templates select="compet"/>
</table>
</xsl:template>


<!--COMPETICION-->
<xsl:template match="compet">
    <xsl:apply-templates select="catg"/>
</xsl:template>

<!--CATEGORIA-->
<xsl:template match="catg">
   <tr>
    <td><b><xsl:value-of select="@tipo"/></b></td>
    <td>
        <select>
           <xsl:apply-templates select="infoperosnal/gimnick"/>
        </select>
    </td>
    <td><xsl:apply-templates select="titulos"/></td>
   </tr>
</xsl:template>

<!--NICKNAME-->
<xsl:template match="gimnick">
  <option value="1"><xsl:value-of select="."/></option>
</xsl:template>

<!--TITULOS-->
<xsl:template match="titulos">

  <xsl:choose>
    <xsl:when test="../@tipo='individual' ">
      <ul >
       <li class="individual"><xsl:value-of select="."/></li>
      </ul>
    </xsl:when>
      
    <xsl:otherwise>
      <ul >
       <li class="tagteam"><xsl:value-of select="."/></li>
       </ul>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


</xsl:stylesheet>

