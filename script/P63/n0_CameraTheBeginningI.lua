-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 80.429344 , 323.095734 , 39.053543 , 33.900055 , [[Camera:ScriptSplineLookAtPosition(97.153,370.359,35.000);
]] )
   Camera:MotionSpline_AddSplinePoint( 88.793282 , 327.362183 , 35.687241 , 24.900059 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 94.368805 , 336.349457 , 31.048573 , 33.800056 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 96.289261 , 343.750580 , 30.281284 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 34.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
