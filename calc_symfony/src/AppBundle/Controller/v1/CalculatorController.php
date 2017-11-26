<?php

namespace AppBundle\Controller\v1;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use AppBundle\Service\SumService;

/**
 * @Route("/v1")
 */
class CalculatorController extends Controller {

    /**
     * Rota responsável pela soma de valores, ela recebe um JSON
     * com a seguinte estrutura: {"0": "valor1", "1": "valor2"[, "2": "valor3"...]}
     * @Route("/sum")
     * @Method({"POST"})
     */
    public function sum(Request $request, SumService $sumService) {
        // Valida se quem chamou a rota enviou dados para serem processados
        if (! $requestData = $request->getContent()) {
            return new JsonResponse('Você precisa enviar valores para a rota!', 400);
        }

        // Responsável por decodificar o JSON recebido na request. 
        // O 'true' faz com que o retorno da chamada do json_decode seja no formato de array
        $decodedValues = json_decode($requestData, true);

        // Chama função pública do serviço SumService
        $sumValue = $sumService->sumMultipleValues($decodedValues);

        // Retorna para o cliente uma resposta em JSON com a estrutura: {"sumValue": "Resultado"}
        return new JsonResponse(['sumValue' => $sumValue]);
    }
}

