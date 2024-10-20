<?php

namespace ContainerIs2ME99;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/*
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getArgumentResolver_ServiceService extends Drift_KernelDevContainer
{
    /*
     * Gets the private 'argument_resolver.service' shared service.
     *
     * @return \Symfony\Component\HttpKernel\Controller\ArgumentResolver\ServiceValueResolver
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/http-kernel/Controller/ArgumentValueResolverInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/symfony/http-kernel/Controller/ArgumentResolver/ServiceValueResolver.php';

        return $container->privates['argument_resolver.service'] = new \Symfony\Component\HttpKernel\Controller\ArgumentResolver\ServiceValueResolver(new \Symfony\Component\DependencyInjection\Argument\ServiceLocator($container->getService, [
            'kernel::build' => ['privates', '.service_locator.u47of.0', 'get_ServiceLocator_U47of_0Service', true],
            'kernel::loadRoutes' => ['privates', '.service_locator.KfbR3DY', 'get_ServiceLocator_KfbR3DYService', true],
            'kernel::process' => ['privates', '.service_locator.u47of.0', 'get_ServiceLocator_U47of_0Service', true],
            'kernel::processTimer' => ['privates', '.service_locator.u47of.0', 'get_ServiceLocator_U47of_0Service', true],
            'kernel::registerContainerConfiguration' => ['privates', '.service_locator.KfbR3DY', 'get_ServiceLocator_KfbR3DYService', true],
            'kernel::terminate' => ['privates', '.service_locator.KfwZsne', 'get_ServiceLocator_KfwZsneService', true],
            'kernel:build' => ['privates', '.service_locator.u47of.0', 'get_ServiceLocator_U47of_0Service', true],
            'kernel:loadRoutes' => ['privates', '.service_locator.KfbR3DY', 'get_ServiceLocator_KfbR3DYService', true],
            'kernel:process' => ['privates', '.service_locator.u47of.0', 'get_ServiceLocator_U47of_0Service', true],
            'kernel:processTimer' => ['privates', '.service_locator.u47of.0', 'get_ServiceLocator_U47of_0Service', true],
            'kernel:registerContainerConfiguration' => ['privates', '.service_locator.KfbR3DY', 'get_ServiceLocator_KfbR3DYService', true],
            'kernel:terminate' => ['privates', '.service_locator.KfwZsne', 'get_ServiceLocator_KfwZsneService', true],
        ], [
            'kernel::build' => '?',
            'kernel::loadRoutes' => '?',
            'kernel::process' => '?',
            'kernel::processTimer' => '?',
            'kernel::registerContainerConfiguration' => '?',
            'kernel::terminate' => '?',
            'kernel:build' => '?',
            'kernel:loadRoutes' => '?',
            'kernel:process' => '?',
            'kernel:processTimer' => '?',
            'kernel:registerContainerConfiguration' => '?',
            'kernel:terminate' => '?',
        ]));
    }
}
