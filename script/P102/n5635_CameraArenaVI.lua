-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 247.353821 , 534.532959 , 10.771690 , 19.300037 , [[Camera:ScriptSplineLookAtNpc(5635);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 248.497437 , 528.186462 , 11.336590 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 249.525848 , 525.136230 , 11.366590 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 250.551636 , 522.089478 , 11.526590 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
