-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 60.062756 , 86.849632 , 30.729174 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5536);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 60.326992 , 89.124115 , 29.649185 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 59.378757 , 92.037079 , 28.359207 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 52.753384 , 93.747063 , 25.119501 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
