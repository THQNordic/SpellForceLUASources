-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 558.596130 , 534.953186 , 70.116692 , 19.600039 , [[Camera:ScriptSplineLookAtNpc(3028);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.7);]] )
   Camera:MotionSpline_AddSplinePoint( 559.066162 , 533.977478 , 70.066689 , 13.000013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 559.534851 , 533.953186 , 70.066689 , 19.500038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 560.003845 , 533.967773 , 70.036705 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
