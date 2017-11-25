<?php

namespace Tests\AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

// Define que a classe extende a suíte de testes do symfony
// O nome precisa terminar com o nome Test para o phpunit saber que ele é um teste
class CalculatorControllerTest extends WebTestCase {

    // Definição de teste, para ele ser executado pelo phpunit
    // precisa iniciar com a palavra 'test'
    public function testSumAction() {
        // Inicia o cliente para fazer requests ao servidor futuramente
        $client = self::createClient();

        // Define os valores que serão enviados para o backend
        $postData = [
            '0' => rand(-50, 50),
            '1' => rand(-50, 50),
            '2' => rand(-50, 50)
        ];

        // Transforma os dados em JSON para serem enviados em RAW e não em FormData
        $postRawData = json_encode($postData);

        // Faz a request para a rota /v1/sum via POST passando os valores em RAW
        $client->request('POST', '/v1/sum', [], [], [], $postRawData);

        // Pega alguns dados da response retornada pelo backend
        $statusCode = $client->getResponse()->getStatusCode();
        $responseContent = json_decode($client->getResponse()->getContent(), true);

        // Valida se o código de retorno da rota foi 200(Sucesso)
        self::assertEquals(200, $statusCode, 'Falha ao fazer request para a url /v1/sum');

        // Soma os valores do array para fazer a validação do valor retornado pelo backend
        $expectedValue = array_sum($postData);
        
        // Valida se o valor esperado é o mesmo que o retornado pelo backend
        self::assertEquals($expectedValue, $responseContent['sumValue'], 'Valor da soma diferente do esperado');
    }

}
