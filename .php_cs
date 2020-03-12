<?php

/**
 * @noinspection PhpUndefinedNamespaceInspection
 * @noinspection PhpUndefinedClassInspection
 */

$finder = PhpCsFixer\Finder::create()
    ->exclude('var')
    ->exclude('tests/_support/_generated')
    ->in(__DIR__)
;

return PhpCsFixer\Config::create()
    ->setFinder($finder)
    ->setRules([
                   '@PSR1' => true,
                   '@PSR2' => true,
                   '@PHP70Migration' => true,
                   '@PHP71Migration' => true,
                   '@PhpCsFixer' => true,

                   'multiline_whitespace_before_semicolons' => ['strategy' => 'no_multi_line'],
                   'phpdoc_align' => ['align' => 'left'],

                   // risky
                   '@PhpCsFixer:risky' => true,
                   '@PHP70Migration:risky' => true,
                   '@PHP71Migration:risky' => true,
               ]
    )
    ->setRiskyAllowed(false);
