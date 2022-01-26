xquery version "1.0";
<html>
<head>
</head>
<body>

{
for $b in doc ("rosterwwe.xml") //catg

return
<div>
<h1> { string( $b/@tipo ) } - { string( $b/../@clase ) } </h1>
<ul>
{
for $e in $b/infoperosnal
return
 <li>  {$e/gimnick/text()}    </li>  
}

</ul>

</div>

}

</body>
</html>