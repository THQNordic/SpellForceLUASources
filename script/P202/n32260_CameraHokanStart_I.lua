-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 513.795837 , 596.693604 , 12.137652 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(483.915,590.308,12.240);]] )
   Camera:MotionSpline_AddSplinePoint( 511.149689 , 595.268433 , 12.137652 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 507.765167 , 593.561035 , 12.137652 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 504.330322 , 591.837952 , 12.137652 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
