<?php

namespace AppBundle\Controller\v1;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/v1")
 */
class CalculatorController extends Controller {

    /**
     * @Route("/sum")
     * @Method({"POST"})
     */
    public function sum(Request $request) {
        //$json = $request->get('json');
        return new JsonResponse(["asdf" => "qwer"]);
    }
}

