-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 576.536438 , 133.346390 , 35.080696 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(515.322,162.381,24.000);]] )
   Camera:MotionSpline_AddSplinePoint( 546.245178 , 142.087021 , 35.520447 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(465.541,201.580,23.177);
Camera:ScriptSplineLookAtApproachingModifier(0.0075);]] )
   Camera:MotionSpline_AddSplinePoint( 510.035858 , 157.628876 , 34.690567 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 480.863068 , 179.866348 , 35.751648 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.742188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
