-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 301.493042 , 197.658264 , 42.866692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(298.412,202.315,41.000);]] )
   Camera:MotionSpline_AddSplinePoint( 301.493042 , 197.658264 , 42.866692 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 301.493042 , 197.658264 , 42.866692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(297.085,196.620,41.000);]] )
   Camera:MotionSpline_AddSplinePoint( 301.493042 , 197.658264 , 42.866692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
