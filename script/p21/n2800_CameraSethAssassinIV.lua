-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 101.574409 , 458.691986 , 31.296093 , 19.700039 , [[Camera:ScriptSplineLookAtNpc(2800);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 102.653946 , 459.597076 , 31.296093 , 11.100006 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 103.374138 , 460.200897 , 31.296093 , 19.600039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 104.813141 , 461.407379 , 31.296093 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
