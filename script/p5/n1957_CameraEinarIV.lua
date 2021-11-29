-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 90.289909 , 537.310730 , 43.556961 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(95.478,553.536,39.820);]] )
   Camera:MotionSpline_AddSplinePoint( 90.290123 , 520.571167 , 45.937576 , 10.200003 , [[Camera:ScriptSplineLookAtApproachingModifier(0.001);]] )
   Camera:MotionSpline_AddSplinePoint( 87.043747 , 482.186371 , 55.512093 , 14.800020 , [[Camera:ScriptSplineLookAtApproachingModifier(0.1);
Camera:ScriptSplineLookAtPosition(95.194,503.547,40.000);]] )
   Camera:MotionSpline_AddSplinePoint( 92.189171 , 461.611908 , 70.066055 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.001);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
