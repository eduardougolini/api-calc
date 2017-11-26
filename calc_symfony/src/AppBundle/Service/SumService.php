<?php

namespace AppBundle\Service;

class SumService {

    public function sumMultipleValues(array $values) : float {
        // Inicia a variável
        $sumValue = 0;
        
        // Faz a somatória dos valores informados no array
        foreach ($values as $value) {
            $sumValue += $value;
        }

        return $sumValue;
    }
    

}
