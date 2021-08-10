<?php


namespace App\Scrapper\Contracts;


interface SourceInterface
{
    public function getUrl(): string;

    public function getName(): string;

    public function getWrapperSelector(): string;

    public function getTitleSelector(): string;

    public function getImageSelector(): string;
}