-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 626.367859 , 324.989990 , 22.062984 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(2496);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2.2);]] )
   Camera:MotionSpline_AddSplinePoint( 626.367859 , 324.989990 , 22.062984 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 626.367859 , 324.989990 , 22.062984 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 626.367859 , 324.989990 , 22.062984 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
