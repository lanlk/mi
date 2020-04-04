<?php

namespace App\Http\Middleware;

use Closure;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class JwtCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // $token = JWTAuth::parseToken()->getToken();
        // $this->user = JWTAuth::parseToken()->authenticate($token);

        return array(123,321);

        return $next($request);
    }
}
