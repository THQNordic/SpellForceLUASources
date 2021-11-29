-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 166.030014 , 332.979095 , 42.794827 , 27.900070 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 164.546387 , 326.407257 , 44.044861 , 17.300030 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 168.660019 , 323.824005 , 43.964867 , 27.800070 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 175.909882 , 324.122009 , 43.604866 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 28.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
