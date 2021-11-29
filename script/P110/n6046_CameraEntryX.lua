-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 79.050682 , 509.223785 , 44.148315 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(6738);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 80.380989 , 507.613861 , 43.208317 , 8.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 81.716972 , 505.997131 , 43.238316 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 81.716972 , 505.997131 , 43.238316 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
