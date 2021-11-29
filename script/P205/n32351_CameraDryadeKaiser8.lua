-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 314.684296 , 388.954987 , 18.388088 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 315.042358 , 386.095428 , 19.061344 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 315.564301 , 381.718597 , 21.951939 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(315.034,407.418,30.966);]] )
   Camera:MotionSpline_AddSplinePoint( 315.547821 , 376.804596 , 25.979778 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
