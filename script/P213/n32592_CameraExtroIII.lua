-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 617.473389 , 336.328674 , 45.783329 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 617.473389 , 336.327881 , 45.783325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 617.473389 , 336.327881 , 45.783325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 617.473389 , 336.327881 , 45.783325 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
