-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 388.391785 , 296.159760 , 14.031572 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(385.443,314.635,20.163);]] )
   Camera:MotionSpline_AddSplinePoint( 390.574493 , 297.687561 , 14.322092 , 2.700000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 392.588287 , 299.795135 , 14.711609 , 6.899996 , [[Camera:ScriptSplineLookAtPosition(386.692,314.760,15.530);
Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 397.369110 , 306.787842 , 15.821463 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 407.462921 , 308.832947 , 29.009357 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
