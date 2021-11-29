-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 192.276001 , 27.378239 , 19.913231 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.339,34.102,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 192.276001 , 27.378239 , 19.913231 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.339,34.102,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 192.276001 , 27.378239 , 19.913231 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.339,34.102,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 192.276001 , 27.378239 , 19.913231 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.339,34.102,18.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
