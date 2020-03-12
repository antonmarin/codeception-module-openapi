<?php

declare(strict_types=1);

namespace antonmarin\CodeceptionOpenApi;

use Codeception\Lib\Interfaces\API;
use Codeception\Lib\Interfaces\DependsOnModule;
use Codeception\Module;

class OpenApi extends Module implements DependsOnModule, API
{
    public function _depends()
    {
        // TODO: Implement _depends() method.
    }
}
