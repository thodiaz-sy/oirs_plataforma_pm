<?php
require '../../../vendor/autoload.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();
$reclamo = $_POST['reclamo'] ?? '';
$respuesta = $_POST['respuesta'] ?? '';
$fecha = new DateTime();
$meses = [
    'January' => 'Enero',
    'February' => 'Febrero',
    'March' => 'Marzo',
    'April' => 'Abril',
    'May' => 'Mayo',
    'June' => 'Junio',
    'July' => 'Julio',
    'August' => 'Agosto',
    'September' => 'Septiembre',
    'October' => 'Octubre',
    'November' => 'Noviembre',
    'December' => 'Diciembre'
];
$mes = $meses[$fecha->format('F')];
$fechaActual = $fecha->format('j') . " de " . $mes . " de " . $fecha->format('Y');

$html = "
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <title>Carta Tipo Reclamos 2024</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .content {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .text-right {
            text-align: right;
        }
        .signature {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class='content'>
        
        <p class='text-right'>Santiago, $fechaActual .</p>

        <p>Señor(a)</p>
        <p>Patricio Avendaño C.</p>
        <p>Presente</p>

        <p>De nuestra consideración:</p>

        <p>Junto con saludarlo muy cordialmente, me permito dar respuesta a su reclamo interpuesto en nuestro Centro Odontológico ubicado en <b>Alcantara</b>, el pasado <b>10</b> de <b>Abril</b> del 2024 en el cual nos plantea que: <b>" . nl2br(htmlspecialchars($reclamo)) . "</b></p>
          

        <p>Lamentamos la situación ocurrida y desde ya le hacemos llegar nuestras disculpas por este inconveniente. Le informamos que: <b>" . nl2br(htmlspecialchars($respuesta)) . "</b></p>
                

        <p>Sin otro particular le saluda con toda atención,</p>
        <div class='signature'>
            <p>Sonia Ramos Moreno</p>
            <p>Directora Administrativa</p>
            <p>Centro Odontológico Padre Mariano</p>
        </div>

        <p>c.c Dirección Clínica</p>
    </div>
</body>
</html>
";

$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream('reclamo.pdf', ['Attachment' => true]); 

?>