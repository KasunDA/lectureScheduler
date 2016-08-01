package com.codingtokyo.zero.utils;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogAop {
	
	@Pointcut("execution(* com.codingtokyo.zero..*.*(..))")  // zero 패키지+하위패키지의 모든 메소드
	private void pointcutMethod(){
	}
	
	@Around(value = "pointcutMethod()")
	public Object loggerAop(ProceedingJoinPoint joinPoint)throws Throwable{
		
		String signature = joinPoint.getSignature().toShortString();
		System.out.println("** [START] " + signature);
//		long startTime = System.currentTimeMillis();
		
		try{
			Object obj = joinPoint.proceed();
			return obj;
		}finally{
//			long endTime = System.currentTimeMillis();
			System.out.println("** [END] " + signature);
//			System.out.println("経過時間 : " + (endTime - startTime));
		}
	}

}