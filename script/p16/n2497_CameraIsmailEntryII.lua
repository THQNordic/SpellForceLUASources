-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 196.545929 , 387.048645 , 28.292213 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(3602);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 198.787323 , 385.472046 , 28.132137 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.601303 , 385.335266 , 28.132336 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 204.091614 , 387.462097 , 28.312332 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
