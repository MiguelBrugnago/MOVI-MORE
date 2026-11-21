<?php

declare(strict_types=1);

namespace App\Contracts;

interface MetricaInterface
{
    public function valor(): int|float|null;
}
