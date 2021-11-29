-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 264.053040 , 181.265030 , 33.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(268.102,176.351,31.000);]] )
   Camera:MotionSpline_AddSplinePoint( 264.053101 , 181.265091 , 33.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(268.102,176.351,31.000);]] )
   Camera:MotionSpline_AddSplinePoint( 264.053101 , 181.265091 , 33.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(268.102,176.351,31.000);]] )
   Camera:MotionSpline_AddSplinePoint( 264.053101 , 181.265091 , 33.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(268.102,176.351,31.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
