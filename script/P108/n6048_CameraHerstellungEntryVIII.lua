-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 573.697998 , 328.633148 , 32.010620 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(644.406,338.018,5.920);]] )
   Camera:MotionSpline_AddSplinePoint( 575.170532 , 325.456970 , 30.110619 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 576.822693 , 321.341217 , 26.842377 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 578.496765 , 317.152588 , 22.940529 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
