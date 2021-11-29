-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 375.752625 , 266.961273 , 30.828623 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(404.887,433.066,49.000);]] )
   Camera:MotionSpline_AddSplinePoint( 395.669983 , 287.241180 , 36.678623 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 405.065704 , 317.161194 , 42.778629 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 420.072266 , 384.959991 , 65.490318 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(403.027,436.201,50.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
