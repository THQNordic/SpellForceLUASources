-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 220.762146 , 400.269989 , 34.422451 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(153.433,449.764,9.000);]] )
   Camera:MotionSpline_AddSplinePoint( 236.600174 , 394.747986 , 35.086445 , 5.799997 , [[Camera:ScriptSplineLookAtPosition(229.152,423.698,15.667);
Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 246.325882 , 398.264984 , 32.340935 , 8.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 250.900589 , 410.937561 , 29.790958 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 277.498383 , 422.064362 , 26.523230 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
