-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 143.532211 , 424.274902 , 36.621857 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(3447);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 142.567871 , 417.757935 , 36.211937 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 145.296173 , 411.080200 , 36.491840 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 151.331757 , 408.171143 , 36.621857 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
