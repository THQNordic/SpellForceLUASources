-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 102.783264 , 426.461670 , 33.903229 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(150.899,406.578,28.700);]] )
   Camera:MotionSpline_AddSplinePoint( 130.074051 , 427.089569 , 33.069473 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 155.995789 , 418.341614 , 32.923222 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 182.239029 , 397.709564 , 33.463398 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
