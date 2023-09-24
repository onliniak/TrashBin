<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use function React\Promise\resolve;

class Mercure
{
    public function FunctionName(String $content)
    {
        $response = new StreamedResponse();
        $response->setCallback(function () {
        var_dump($content);
        flush();
});
    }
    
    public function Publish(Request $request) : Response
    {
        if ($request->request->get('txt')) {
            FunctionName($request->request->get('txt'));
        };

        return resolve(
            new Response(
                ''
        ));
    }
}
?>